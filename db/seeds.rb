# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create(email: 'admin@lab.com', password: '12345678', profile: 'administrator')
Admin.create(email: 'daniognr@hotmail.com', password: 'passwo00', profile: 'administrator')

Schedule.create(title: 'DÍAS Y HORARIOS DE ATENCIÓN SIN TURNO', text: 'Martes de 08:00 a 16:00 hs., Miércoles de 10:30 a 19:00 hs.<br>Jueves de 10:30 a 16:00 hs., Viernes de 10:30 a 16:00 hs.')
Schedule.create(title: 'OTROS DÍAS/ HORARIOS CON TURNO', text: 'Solicitar turno al +54 221 4219364 o al +54 221 15 4857016<br>o via mail <a href="mailto:info@laboratorioyfertilidad.com">info@laboratorioyfertilidad.com</a>')
Schedule.create(title: 'PRÁCTICAS CON TURNO, EXTRACCIONES:', text: 'Martes de 08:30 a 10:30 hs.')