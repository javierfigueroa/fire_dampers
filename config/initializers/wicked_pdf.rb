WickedPdf.config = {
  #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
  #:layout => "pdf.html",
  :exe_path =>  Rails.root.join('bin', 'wkhtmltopdf-0.9.9-OS-X.i368').to_s
}