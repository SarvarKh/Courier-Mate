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
public class Transport {
    private Integer id;
    private String name;
    private BigDecimal rate;
    private Integer courierId;
}
