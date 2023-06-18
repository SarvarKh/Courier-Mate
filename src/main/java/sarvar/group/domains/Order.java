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
    private Double travelDistance; // in km
    private Double travelTime; // in minutes
    private PaymentType paymentType;
    private Integer courierId;
    private Integer clientId;
    private Integer rate; // of selected transport in USD per km.
    private Double totalAmount;
    private Status status;

}
