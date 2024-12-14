module Settings
  PHONE_PREFIX = '+56'

  EXIT_KEYWORDS = ['e', 'exit']

  MESSAGES = {
    contact_created: "Contact '%s' created succesfully!",
    contact_not_found: "Contact '%s' not found. Please, search by a valid name.",
    contact_found: "Contact found. Listing...",
    number_not_valid: "'%s' Is not a valid number."
  }

  CONTACT_VIEW_FORMAT = "%{id} - %{name.capitalize} - %{number} - %{city.capitalize}"
end