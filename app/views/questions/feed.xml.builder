xml.instruct!
xml.channel do |channel|
  channel.title "Hackerboard"
  channel.link root_url
  channel.description "A hacker forum"
  channel.language I18n.locale.to_s

  @questions.each do |question|
    channel.item do |item|
      item.title question.title
      item.link question_url(question)
      item.comments question_url(question, :anchor => "#comments")
      item.category question.category.name
    end
  end

  # <item>
  #                 <title>Usando modelos ActiveRecord entre projetos diferentes</title>
  #                 <link>http://feedproxy.google.com/~r/simplesideias/~3/z8eJEFn8zCs/</link>
  #                 <comments>http://simplesideias.com.br/usando-modelos-activerecord-entre-projetos-diferentes/#comments</comments>
  #                 <pubDate>Tue, 06 Mar 2012 18:36:39 +0000</pubDate>
  #                 <dc:creator>Nando Vieira</dc:creator>
  #                                 <category><![CDATA[Ruby]]></category>
  #                 <category><![CDATA[Ruby on Rails]]></category>
end
