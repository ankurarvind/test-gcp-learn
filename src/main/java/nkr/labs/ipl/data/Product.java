package nkr.labs.ipl.data;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Product {

    private String productId;
    private String productName;
    private String productVersion;
}
