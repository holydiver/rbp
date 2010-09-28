require File.join(File.expand_path(File.dirname(__FILE__)), 'format')
require File.join(File.expand_path(File.dirname(__FILE__)), 'prawn_document')

class MyReport < Fatty::Formatter
  required_params :first_name, :last_name

  helpers do
    def full_name
      "#{params[:first_name]} #{params[:last_name]}"
    end
  end

  format :txt do
    def render
      "Hello #{full_name} from plain text"
    end
  end

  format :pdf, :base => Prawn::FattyFormat do
    def render
      doc.text "Hello #{full_name} from PDF"
      doc.render
    end
  end
end
