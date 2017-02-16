require('rspec')
require('contacts')


describe(Contacts) do
  before() do
    Contacts.clear()
  end
  describe('#first_name') do
    it ("saves the first name") do
      test_contacts = Contacts.new({:first_name=>"brian", :last_name =>"kiptoo", :job_title =>"coder", :company =>"moringa"})
      test_contacts.save()
      expect(test_contacts.first_name()).to(eq("brian"))
    end
  end
  describe('#last_name') do
    it ("saves the last name") do
      test_contacts = Contacts.new({:first_name=>"brian", :last_name =>"kiptoo", :job_title =>"coder", :company =>"moringa"})
      expect(test_contacts.last_name()).to(eq("kiptoo"))
    end
  end
  describe('#job_title') do
    it ("saves the job title") do
      test_contacts = Contacts.new({:first_name=>"brian", :last_name =>"kiptoo", :job_title =>"coder", :company =>"moringa"})
      expect(test_contacts.job_title()).to(eq("coder"))
    end
  end
  describe('#company') do
    it ("saves the company") do
      test_contacts = Contacts.new({:first_name=>"brian", :last_name =>"kiptoo", :job_title =>"coder", :company =>"moringa"})
      expect(test_contacts.company()).to(eq("moringa"))
    end
  end

  describe("#id") do
      it("returns the id of the contact") do
        test_contacts = Contacts.new({:first_name=>"brian", :last_name =>"kiptoo", :job_title =>"coder", :company =>"moringa"})
        test_contacts.save()
        expect(test_contacts.id()).to(eq(1))
      end
    end
    describe(".find") do
      it("returns a contact by its id number") do
        test_contacts = Contacts.new({:first_name=>"brian", :last_name =>"kiptoo", :job_title =>"coder", :company =>"moringa"})
        test_contacts.save()
        test_contacts2 = Contacts.new({:first_name=>"brian", :last_name =>"kiptoo", :job_title =>"coder", :company =>"moringa"})
        test_contacts2.save()
        expect(Contacts.find(test_contacts.id())).to(eq(test_contacts))
      end
    end
end
