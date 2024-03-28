package question1;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import java.io.*;
import java.net.URL;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class task1 {

    public static void main(String[] args) {
        try {
            // URL da página
            String url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos";

            // Conecta à página e obtém o HTML
            Document doc = Jsoup.connect(url).get();

            // Encontra todos os links na página
            Elements links = doc.select("a[href]");

            // Strings para armazenar os URLs dos anexos
            String anexo1Url = "";
            String anexo2Url = "";

            // Itera sobre os links encontrados para encontrar os URLs dos anexos Anexo I e Anexo II
            for (Element link : links) {
                String text = link.text().trim();
                if (text.equals("Anexo I")) {
                    anexo1Url = link.attr("abs:href");
                } if (text.equals("Anexo II.")) {
                    anexo2Url = link.attr("abs:href");
                }
            }

            // Baixa os anexos Anexo I e Anexo II
            downloadAnexo(anexo1Url, "Anexo I.pdf");
            downloadAnexo(anexo2Url, "Anexo II.pdf");

            criarArquivoZip("anexos.zip", "Anexo I.pdf", "Anexo II.pdf");

            System.out.println("Downloads concluídos e arquivo ZIP criado com sucesso.");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void downloadAnexo(String pdfUrl, String fileName) throws IOException {
        // Baixa o arquivo PDF
        try (InputStream in = new URL(pdfUrl).openStream();
             FileOutputStream out = new FileOutputStream(fileName)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
            System.out.println("Download concluído: " + fileName);
        } catch (IOException e) {
            System.out.println("Erro ao baixar o arquivo: " + fileName);
            e.printStackTrace();
        }
    }

    private static void criarArquivoZip(String zipFileName, String... filesToArchive) throws IOException {
        try (ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zipFileName))) {
            for (String fileName : filesToArchive) {
                File file = new File(fileName);
                FileInputStream fis = new FileInputStream(file);
                zos.putNextEntry(new ZipEntry(file.getName()));
                byte[] buffer = new byte[1024];
                int length;
                while ((length = fis.read(buffer)) > 0) {
                    zos.write(buffer, 0, length);
                }
                zos.closeEntry();
                fis.close();
            }
        }
    }
}
