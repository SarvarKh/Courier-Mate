package sarvar.group.domains;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import sarvar.group.domains.util.PaymentType;
import sarvar.group.domains.util.Status;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private Integer id;
    private Integer courierId;
    private Integer clientId;

    private Integer travelDistance; // in meters
    private String travelTime; // in minutes
    private Integer orderNumber;
    private PaymentType paymentType;
    private BigDecimal totalAmount;
    private Integer transportId;
    private Status status;

}
