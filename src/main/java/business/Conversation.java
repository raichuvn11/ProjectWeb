package business;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;


@Entity
public class Conversation implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long conversationID;

    @OneToMany
    private List<Message> messageList = new ArrayList<>();

    public Conversation() {
    }

    public Conversation(Long conversationID) {
        this.conversationID = conversationID;
    }

    public Long getConversationID() {
        return conversationID;
    }

    public void setConversationID(Long conversationID) {
        this.conversationID = conversationID;
    }

    public List<Message> getMessageList() {
        return messageList;
    }

    public void setMessageList(List<Message> messageList) {
        this.messageList = messageList;
    }

}