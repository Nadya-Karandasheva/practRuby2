#!C:\Ruby32-x64\bin\ruby.exe

# создание един. объекта подключения.
require 'mysql2'
client = Mysql2::Client.new(
	:host     => '8080',
	:username => 'root',
	:password => '',
	:database => 'SienceResearch',
	:encoding => 'utf8'
	)
		
# главная функция для показа строк, работает всегда.
def viewSelect(client)
	tableFirst = client.query("SHOW COLUMNS FROM Sector");
	tableSecond = connection.query('SHOW COLUMNS FROM Locations');
	puts '<tr>'
	tableFirst.each do |row|
	  puts '<td>'+row['Field'].to_s+'</td>'
	  tableSecond.each do |row|
	  puts '<td>'+row['Field'].to_s+'</td>'
	end
	puts '</tr>'

	results = client.query("CALL joinTable('Sector', 'Locations')")
	results.each do |row|
	  puts '<tr><td>'+row['coordinates'].to_s+'</td>
	  		<td>'+row['light_intensity']+'</td>
			<td>'+row['foreign_objects']+'</td>
			<td>'+row['star_objects']+'</td>
			<td>'+row['undefined_objects']+'</td>
			<td>'+row['specified_objects']+'</td>
			<td>'+row['notes']+'</td>
			<td>'+row['id']+'</td>
			<td>'+row['earth_position']+'</td>
			<td>'+row['sun_position']+'</td>
			<td>'+row['moon_position']+'</td>
			<td>'+row['id']+'</td>
		</tr>'
	end
end

# подпись.
def viewVer(client)
	results = client.query("SELECT VERSION() AS ver")
	results.each do |row|
	  puts row['ver']
	end
end

# чтение шаблона и отображение на экране.
puts "Content-type: text/html\n\n"
File.readlines('select.html').each do |line|

	s = String.new(line)
	s.gsub!(/[^0-9A-Za-z @]/, '')

	if s != "@tr" && s != "@ver"
		puts(line)
	end
	if s == "@tr"
		viewSelect(client)
	end
	if s == "@ver"
		viewVer(client)
	end
end