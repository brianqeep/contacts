require('sinatra')
  require('sinatra/reloader')
  also_reload('lib/**/*.rb')
  require('./lib/contacts')

get('/') do
  erb(:index)
end

get('/contacts') do
  @contacts = Contacts.all()
  erb(:contacts)
end

get('/contacts/new') do
  erb(:contacts_form)
end

post('/contacts') do
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  job_title = params.fetch("job_title")
  company = params.fetch("company")

  contact = Contacts.new(@first_name, @last_name, @job_title, @company)
  contact.save()
  erb(:success)
end

get('/contacts/:id') do
  @contact = Contacts.find(params.fetch("id"))
  erb(:contact)
end
