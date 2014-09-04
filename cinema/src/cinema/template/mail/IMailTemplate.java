package cinema.template.mail;

public interface IMailTemplate
{
    void init();

    String subject();

    String body();
}