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
    // [1~3] Timeliness: How quickly the service delivers products or services?
    private Integer timeliness;

    // [1~3] Condition: How well the products or services are packaged and protected during delivery?
    private Integer condition;

    // [1~3] Communication: How well the service communicates with customers about delivery status and any potential delays?
    private Integer communication;

    // Any feedback from client to particular service of courier
    private String remarks;

    // Client assess a courier
    private Integer client_id;
    private Integer courier_id;
    private Integer order_id;
}
