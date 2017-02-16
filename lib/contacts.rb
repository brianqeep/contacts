class Contacts
  @@contacts = []
  attr_reader(:first_name, :last_name, :job_title, :company)
  define_method(:initialize) do |person|
    @first_name = person.fetch(:first_name)
    @last_name  = person.fetch(:last_name)
    @job_title  = person.fetch(:job_title)
    @company  = person.fetch(:company)
    @id = @@contacts.length().+(1)
  end
  define_method(:id) do
      @id
  end
  define_singleton_method(:clear) do
      @@contacts = []
    end
  define_singleton_method(:all) do
      @@contacts
  end
  define_method(:save) do
      @@contacts.push(self)
  end

  define_singleton_method(:find) do |identification|
      found_contacts = nil
      @@contacts.each() do |contact|
        if contact.id().eql?(identification.to_i())
          found_contacts = contact
        end
      end
      found_contacts
    end
end
