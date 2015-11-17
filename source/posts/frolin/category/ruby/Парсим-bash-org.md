---
title: Парсим bash.org
date: 2015-11-15 13:26 UTC
tags: web-scraping
---


Ruby многогранен! Одна из его прекрасных граней — работа с данными.
А благодаря гему [Mechanize]('https://github.com/sparklemotion/mechanize') мы можем с легкостю работать с данными по HTTP.

> Гем Mechanize позволяет работать только со статичными данными, без участия javascript в генерации контента. 
Для того что бы работать с динамическим контентом существует несколько гемов:
    * Watir
    * Selenium WebDriver
{: class="info"}


Например, нам захотелось получать самые свежие посты с bash.org.

READMORE

Для начала, создадим файл — parser.rb.

 * Добавим необходимые гемы.
 * Создадим метод инициализации браузера
 * Аргументом будем передовать адрес url

```ruby
require 'rubygems'
require 'mechanize'
require 'awesome_print' # Для красивого вывода списков.

def goto(url)
  agent = Mechanize.new #{|a| a.log = Logger.new(STDERR) } 
  agent.user_agent_alias =  'Linux Mozilla'
  agent.get('http://' + url)
end
```

Теперь запустим irb, и попробуем погулять по интернету через коммандную строку.

```ruby
>> ya_page = goto 'ya.ru'

=> #<Mechanize::Page
 {url #<URI::HTTP:0x00000002dcf648 URL:http://ya.ru/>}
 {meta_refresh}
 {title "Яндекс"}
 {iframes}
 {frames}
 {links
  #<Mechanize::Page::Link "Войти в почту" "https://mail.yandex.ru">
  #<Mechanize::Page::Link "" "//www.yandex.ru">}
 {forms
  #<Mechanize::Form
   {name nil}
   {method "GET"}
   {action "http://yandex.ru/search/"}
   {fields [text:0x173ec58 type:  name: text value: ]}
   {radiobuttons}
   {checkboxes}
   {file_uploads}
   {buttons [button:0x1745fd0 type: submit name:  value: ]}}
```

Мы получили страницу, как объект класса Mechanize::Page со всеми вложенными объектами страницы.

А теперь попробуем проаналализировать что же за страница перед нами?

   * Мы видим что на странице есть ссылка "Войти в почту",
   * Есть get форма с action  http://yandex.ru/search/
   * Есть поле с именем "text"
   * Есть кнопка с типом submit.




Попробуем отправить эту форму и посмотреть что же она выдаст.

```ruby
goto('ya.ru').form do |form| # => Mechanize::Form
  form['text'] = 'ruby is awesome'
  result_page = form.submit

  #собераем и выводим результаты
  #.serp-item класс каждого блока
 ap result_page.search('.serp-item > h2 a').collect { |link|
    {
       title: link.text,
       link: link.attributes['href'].text
    }
  }
end
```

```ruby
>>  [ 0] {
         :title => "A collection of awesome Ruby libraries, tools, frameworks...",
         :link => "http://awesome-ruby.com/"
       },
    [ 1] {
         :title => "Overview of the ruby language and bits of awesome it gives...",
         :link => "http://es.slideshare.net/astrails/ruby-is-awesome-16466895"
       },
    [ 2] {
         :title => "Supernatural - Ruby is awesome :: Дополнения Firefox",
         :link => "https://addons.mozilla.org/Ru/firefox/addon/supernatural-ruby-is-awesome/"
       },
    [ 3] {
         :title => "Ruby Is Awesome's Profile - Vine",
         :link => "https://vine.co/u/1127300097919881216"
       },
    [ 4] {
         :title => "MythBusting -- We Agree! Ruby is Awesome!",
         :link => "http://yehudakatz.com/2008/11/16/mythbusting-we-agree-ruby-is-awesome/"
       },
    [ 5] {
         :title => "markets/awesome-ruby · GitHub",
         :link => "https://github.com/markets/awesome-ruby"
       }, ...
```




а вот так, сможем воспользоваться поиском яндекса (если будете сильно шалить -- забанят )



Теперь можем работь с её данными через эти методы.
Например так, мы получим всё что находиться в "теле" страницы в формате html.

```ruby
>> ya_page.body
```






Но а пока мы хотим получать самые свежие посты с bash.org
Для этого добавим еще один метод.

```ruby
def parsing(page)
  page.search('#body > div.quote').collect { |quote|
    {
      :id => quote.search('a.id').text,
      :date => quote.search('span.date').text,
      :rating => quote.search('span.rating-o').text,
      :text => quote.search('div.text').text
    }
end
```



итого мы получаем:

```ruby
require 'rubygems'
require 'mechanize'
require 'awesome_print'

def goto(url)
  agent = Mechanize.new #{|a| a.log = Logger.new(STDERR) }
  agent.user_agent_alias =  'Linux Mozilla'
  agent.get('http://' + url)
end

def parsing(page)
  page.search('#body > div.quote').collect do |quote|
    { :id => quote.search('a.id').text,
      :date => quote.search('span.date').text,
      :rating => quote.search('span.rating-o').text,
      :text => quote.search('div.text').text }
  end
end


page = goto('www.bash.im')
ap parsing(page)
```