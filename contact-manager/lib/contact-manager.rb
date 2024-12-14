require_relative 'contact'
require_relative '../config/settings'

class ContactManager
  def initialize
    @contacts = {}
  end

  def add_contact(name, number, city)
    id = rand(1000...10000)
    while @contacts.key?(id)
      id = rand(1000...10000)
    end

    @contacts[id] = Contact.new(id, name.downcase, number, city.downcase)
    puts Settings::MESSAGES[:contact_created] % name
  end

  def view_contacts
    @contacts.each do |id, contact|
      list_contact contact
    end
  end
  
  def search_by_name(name)
    @contacts.each_value do |contact|
      if contact.name == name.downcase
        puts Settings::MESSAGES[:contact_found]
        sleep(1)
        list_contact contact
        break
      else
        puts Settings::MESSAGES[:contact_not_found] % name
      end
    end
  end

  def list_contact(contact)
    puts Settings::CONTACT_VIEW_FORMAT % {id: contact.id, name: contact.name, number: contact.number, city: contact.city}
  end
end