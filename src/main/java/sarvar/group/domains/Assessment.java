package sarvar.group.domains;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Assessment {
    private Integer id;

    // [1~3] Timeliness: How quickly the service delivers products or services?
    private Integer timeliness;

    // [1~3] Condition: How well the products or services are packaged and protected during delivery?
    private Integer condition;

    // [1~3] Communication: How well the service communicates with customers about delivery status and any potential delays?
    private Integer communication;

    // Client assess a courier
    private Integer clientId;
    private Integer courierId;
    private Integer orderId;
}
