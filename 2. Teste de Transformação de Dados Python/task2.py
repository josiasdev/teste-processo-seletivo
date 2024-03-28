import fitz  # PyMuPDF
import csv
import zipfile

def extract_text_from_pdf(pdf_file_path):
    try:
        text = ""
        with fitz.open(pdf_file_path) as pdf_file:
            for page in pdf_file:
                text += page.get_text()
        return text
    except Exception as e:
        print(f"Erro ao extrair texto do PDF: {e}")
        return None

def extract_table_data(extracted_text):
    if extracted_text:
        table_data = []
        lines = extracted_text.split('\n')
        for line in lines:
            row = [cell.strip() for cell in line.split(';')]
            table_data.append(row)
        return table_data
    else:
        return None

def replace_abbreviations(table_data):
    if table_data:
        abbreviation_mapping = {
            'OD': 'Seg. Odontológica',
            'AMB': 'Seg. Ambulatorial'
        }
        for row in table_data:
            for i, cell in enumerate(row):
                if cell in abbreviation_mapping:
                    row[i] = abbreviation_mapping[cell]

def save_data_to_csv(table_data, csv_file_name):
    if table_data:
        try:
            with open(csv_file_name, 'w', newline='') as csv_file:
                writer = csv.writer(csv_file)
                for row in table_data:
                    writer.writerow(row)
        except Exception as e:
            print(f"Erro ao salvar dados no arquivo CSV: {e}")

def zip_csv(csv_file_name, zip_file_name):
    try:
        with zipfile.ZipFile(zip_file_name, 'w') as zip_file:
            zip_file.write(csv_file_name)
    except Exception as e:
        print(f"Erro ao compactar o arquivo CSV: {e}")

def main():
    pdf_file_path = 'Anexo I.pdf'
    csv_file_name = 'rol_procedimentos2.csv'
    zip_file_name = 'Teste2.zip'

    # Extract text from PDF
    extracted_text = extract_text_from_pdf(pdf_file_path)

    # Extract table data from extracted text
    table_data = extract_table_data(extracted_text)

    # Replace abbreviations in OD and AMB columns
    replace_abbreviations(table_data)

    # Save data to CSV
    save_data_to_csv(table_data, csv_file_name)

    # Zip CSV file
    zip_csv(csv_file_name, zip_file_name)

if __name__ == "__main__":
    main()
