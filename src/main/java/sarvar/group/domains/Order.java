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
    private Integer travelDistance; // in meters
    private Integer travelTime; // in minutes
    private PaymentType paymentType;
    private Integer courierId;
    private Integer clientId;
    private Integer rate; // of selected transport in USD per km.
    private Integer totalAmount;
    private Status status;

}
