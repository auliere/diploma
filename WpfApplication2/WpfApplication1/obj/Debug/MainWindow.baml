   M S B A M L   `   `   `  ����J  FWpfApplication1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:WpfApplication1WpfApplication1  5   	        WpfApplication1.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   /localclr-namespace:WpfApplication1     5   	     � Title$3  -Налаштування агрегатора��5   	   $��172.697��6)   $��376.097��6:    � 	Resources 5	      :  4System.Windows.Controls.Primitives.DatePickerTextBox �� 
TargetType �� Property �� Value��%g   '        �� 5
   
   "  6   .�5      ��  � ��$ Оберіть дату��6%   5      5      .��5      � $��0,0,2,0q�6    � ColumnDefinitions 5   
   �� 5      $	��39* �6   �� 5      $	��61* �6   .+�5   
   (  "System.Windows.Controls.DatePicker  $��
55,43,25,0q�6   $	��Top=�6)   $��1��6A     5   
   $��
55,72,25,0q�6   $	��Top=�6)   $��1��6A   �� 5   
   -   5         ��Name$ 	startDate��5      $0��*Дата першої публікації��6#   $
��Left=�6D   $��	17,38,0,0q�6_   $	��Top=�6r   $��2��6�   $	��149��6�   �� 5   
   -   5        $ endDate��5      $6��0Дата останньої публікації��6!   $
��Left=�6E   $��	17,69,0,0q�6`   $	��Top=�6s   $��2��6�   �� 5   
   -   5         ��Name$ button��5      $��2��6!   $+��%Розпочати агрегацію��65   $��114,112,109,0q�6S   $	��Top=�6j   6�   �� 5   
   -   5         ��Name$ comboBox��5      	 �� 
IsEditable	 . 
 �� Text$$
 Оберіть веб-сайт��67   $��
17,16,25,0q�6O   $	��Top=�6c   $��2��6{   .@�5      �� .��6   www.pravda.com.ua6/   �� 5      .��6   www.nytimes.com6,   �� 5      .��6   www.meta.ua6(   �� 5      .��6   www.unian.net6*   5      5      5      