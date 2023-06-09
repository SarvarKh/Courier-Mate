package sarvar.group.domains;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Address {
    private Integer id;
    private String homeNumber;
    private String Street;
    private String zipcode;
    private String city;
    private String region;
    private String country;
}
