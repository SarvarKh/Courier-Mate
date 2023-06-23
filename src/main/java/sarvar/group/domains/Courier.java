package sarvar.group.domains;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import sarvar.group.domains.util.Active;
import sarvar.group.domains.util.Approval;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Courier {
    private Integer id;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private Active active;
    private String password;
    private Approval approval;
}
