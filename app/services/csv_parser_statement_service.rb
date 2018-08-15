class CsvParserStatementService
  def parse(csv_file)
    tmp = csv_file.tempfile
    csv_text = File.read(tmp)
    CSV.parse(csv_text, headers: true)
  end
end
