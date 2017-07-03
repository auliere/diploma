using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OpenQA.Selenium;
using OpenQA.Selenium.PhantomJS;
using System.IO;
using Article = System.Tuple<string, string, string>;

namespace Aggregator
{
    class Program
    {
        static string datestr;
        static string folder;

        static IWebDriver CreateInfolessPhantom(string logFilePath = null)
        {
            PhantomJSDriverService service = PhantomJSDriverService.CreateDefaultService();
            service.LogFile = logFilePath;
            service.HideCommandPromptWindow = true;
            return new PhantomJSDriver(service);
        }

        static string GetSafeFileName(string filename)
        {
            return string.Join("_", filename.Split(Path.GetInvalidFileNameChars()));
        }

        static void WriteArticle(Article article)
        {
            Console.WriteLine("Writing: " + article.Item3);
            if (!File.Exists(folder + @"\" + GetSafeFileName(article.Item3) + ".txt"))
            {
                var file = System.IO.File.CreateText(folder + @"\" + GetSafeFileName(article.Item3) + ".txt");
                file.WriteLine(article.Item1);
                file.Write(article.Item2);
                file.Dispose();
            }
        }

        static Article ExtractArticle(string link)
        {
            Console.WriteLine("Crawling: " + link);
            var d = CreateInfolessPhantom();
            d.Url = link;
            var title = d.Title;
            d.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);
            string xpath = "//div[@class='post_news__text' or @class='post__text' or @class='text' or @class='article-wrap' or @class='article-body' or @class='mtext']//p";
            string text = "";
            try
            {                
                var paragraphs = d.FindElements(By.XPath(xpath));
                text = (from p in paragraphs select p.Text).Aggregate((i, j) => i + Environment.NewLine + j);
            }
            catch (Exception e)
            {
                text = "ERROR: " + e.Message;
            }
            d.Dispose();
            return new Article(link, text, title);
        }
        
        static void Main(string[] args)
        {
            var url = @"http://www.pravda.com.ua/";
            var date = DateTime.Today;
            datestr = date.ToString("ddMMyyyy");
            var currentUrl = url + "archives/date_" + datestr + "/";

            IWebDriver driver = new PhantomJSDriver();
            driver.Url = currentUrl;
            var result = driver.FindElements(By.ClassName("article__title"));
            var links = new List<string>();
            foreach (var res in result)
            {
                links.Add(res.FindElement(By.XPath(".//a")).GetAttribute("href"));
            }
            folder = @"D:\Aggregator\" + datestr;
            System.IO.Directory.CreateDirectory(folder);
            driver.Dispose();
            Parallel.ForEach(links, link =>
            {
                var article = ExtractArticle(link);
                Console.WriteLine("Waiting for crawler to stop");
                WriteArticle(article);
            });            

            Console.Clear();
            Console.WriteLine("Job finished. Press any key");
            Console.ReadKey();
        }
    }
}
