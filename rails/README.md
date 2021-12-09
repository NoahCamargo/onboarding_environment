# Rails

Ambiente contendo:
- Ruby 2.2.7
- Rails 4

## Uso

```bash
docker-compose run rails bash
```

# Application Instructions

## Routes

- **/products**  | GET |
> The **/products** route returns a json with all the products registered in the database. If the database is empty it will return an empty json.


- **/products**  | POST |
> The route **/products** is responsible for creating and adding the product to the database. In the body of the request you must have all the values of the product.
> Values (None of the values can be empty or null)
> - sku | string |: This value is the product identifier. I chose to put it in string because the code pattern can vary from characters to numbers.
> - name | string |: This value is the name of the product.
> - description | string |: This value is the description of the product.
> - amount | integer |: This value refers to the amount of the product.
> - price | float |: This value refes to the price of the product.

- **/products** | PUT |
> The **/products/[id]** route is responsible for updating a registered product. This route requires product identification.
> The values of the request for update are the in the route **/products** | POST |. You can put only the values you want to update.

- **/products/[id]** | DELETE |
> The **/products/[id]** route is responsible for deleting a registred product. This route requires product identification.

- **/products/[id]** | GET |
> The **/products/[id]** route is responsible for showing a registred product. This route requires product identification.
