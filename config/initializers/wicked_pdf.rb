if Rails.env.development?
  WickedPdf.config = {
      :exe_path => "#{Rails.root}/lib/wicked_pdf/wkhtmltopdf-mac"
  }
end