package sarvar.group.domains;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import sarvar.group.domains.util.PaymentType;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private Integer id;
    private Integer transportId;
    private String startGeohash;
    private String finishGeohash;
    private Integer orderNumber;
    private PaymentType paymentType;
    private Integer priceId;
    private BigDecimal totalAmount;
    private Integer courierId;
    private Integer clientId;
}
