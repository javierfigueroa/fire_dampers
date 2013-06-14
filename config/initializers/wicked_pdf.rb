WickedPdf.config = {
  #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
  #:layout => "pdf.html",
  :exe_path =>  Rails.root.join('bin', 'wkhtmltopdf-OS-X.ppc').to_s
}