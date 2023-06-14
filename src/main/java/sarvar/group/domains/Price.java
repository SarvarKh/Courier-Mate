package sarvar.group.domains;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Price {
    private Integer id;
    private Integer distanceMin;
    private Integer distanceMax;
    private BigDecimal tariff;
    private Integer courierId;
}
