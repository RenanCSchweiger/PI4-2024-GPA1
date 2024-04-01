package com.EcoCiclo.reciclagens.utils;

import com.EcoCiclo.reciclagens.dto.EmpresaPropostaDto;
import com.EcoCiclo.reciclagens.model.Doacao;
import org.springframework.stereotype.Service;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;
import java.util.Objects;
import java.util.Properties;


@Service
public class EmailService {
    private static final String host = "smtp.gmail.com";
    private static final int porta = 587;
    private static final String usuario = "ecociclo.br@gmail.com";
    private static final String senha = "fewk lana blui hfcj";

    public void enviarEmail(byte[] anexo, Doacao doacao, String dest) {
        String destinatario = dest;
        String assunto = String.format("Nova doação do usuario: %s", doacao.getDoador().getNome());


        // Configurar as propriedades
        Properties propriedades = new Properties();
        propriedades.put("mail.smtp.auth", "true");
        propriedades.put("mail.smtp.starttls.enable", "true");
        propriedades.put("mail.smtp.host", host);
        propriedades.put("mail.smtp.port", porta);
        propriedades.put("mail.smtp.ssl.trust", "*");

        // Obter uma sessão
        Session sessao = Session.getInstance(propriedades, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(usuario, senha);
            }
        });

        try {
            Message mensagemEmail = new MimeMessage(sessao);
            mensagemEmail.setFrom(new InternetAddress(usuario));
            mensagemEmail.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));

            MimeBodyPart textoParte = new MimeBodyPart();

            if (dest.equals("ecociclo.br@gmail.com")) {
                assunto = "Nova doação para a Eco Ciclo";
                textoParte.setText(String.format("Eco ciclo Recebeu uma NOVA doação.\n" +
                        "Mensagem do doador: %s ", doacao.getMensagem()));
            }else {
                textoParte.setText(String.format("mensagem do %s: \n" +
                        "%s ", doacao.getDoador().getNome(), doacao.getMensagem()));
            }

            mensagemEmail.setSubject(assunto);

            MimeBodyPart anexoParte = new MimeBodyPart();

            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(textoParte);

            if (Objects.nonNull(anexo)) {
                DataSource source = new ByteArrayDataSource(anexo, "image/jpeg");
                anexoParte.setDataHandler(new DataHandler(source));
                anexoParte.setFileName("comprovante");
                multipart.addBodyPart(anexoParte);
            }

            mensagemEmail.setContent(multipart);
            Transport.send(mensagemEmail);

            System.out.println("E-mail enviado com sucesso!");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    public void enviarEmailComAnexo(byte[] anexo, EmpresaPropostaDto empresa, byte[] logo) throws MessagingException {

        String destinatario = "ecociclo.br@gmail.com";
        String assunto = String.format("Nova proposta de cadastro da empresa %s", empresa.getNome());
        String mensagem = String.format("Informações da empresa: \n" +
                        "Razão social: %s\n" +
                        "CNPJ: %s\n" +
                        "TIPO: %s\n" +
                        "Email: %s\n" +
                        "Telefone: %s\n" +
                        "Endereço: %s\n" +
                        "Pix: %s\n" +
                        "Site: %s \n" +
                        "Descrição: %s",
                empresa.getNome(),
                empresa.getCnpj(),
                empresa.getTipo(),
                empresa.getEmail(),
                empresa.getTelefone(),
                empresa.getEndereco(),
                empresa.getPix(),
                empresa.getSite(),
                empresa.getDescricao());

        Properties propriedades = new Properties();
        propriedades.put("mail.smtp.auth", "true");
        propriedades.put("mail.smtp.starttls.enable", "true");
        propriedades.put("mail.smtp.host", host);
        propriedades.put("mail.smtp.port", porta);
        propriedades.put("mail.smtp.ssl.trust", "*");

        Session sessao = Session.getInstance(propriedades, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(usuario, senha);
            }
        });

        try {
            Message mensagemEmail = new MimeMessage(sessao);
            mensagemEmail.setFrom(new InternetAddress(usuario));
            mensagemEmail.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
            mensagemEmail.setSubject(assunto);

            MimeBodyPart textoParte = new MimeBodyPart();
            textoParte.setText(mensagem);

            MimeBodyPart anexoParte = new MimeBodyPart();

            MimeBodyPart Anexologo = new MimeBodyPart();
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(textoParte);

            if (Objects.nonNull(anexo)) {
                DataSource source = new ByteArrayDataSource(anexo, "image/jpeg");
                anexoParte.setDataHandler(new DataHandler(source));
                anexoParte.setFileName("comprovante");
                multipart.addBodyPart(anexoParte);
            }

            if (Objects.nonNull(logo)) {
                DataSource logoSource = new ByteArrayDataSource(logo, "image/jpeg");
                Anexologo.setDataHandler(new DataHandler(logoSource));
                Anexologo.setFileName("logo");
                multipart.addBodyPart(Anexologo);
            }

            mensagemEmail.setContent(multipart);
            Transport.send(mensagemEmail);

            System.out.println("E-mail enviado com sucesso!");

        } catch (MessagingException e) {
            e.printStackTrace();
            throw e;
        }
    }

}
