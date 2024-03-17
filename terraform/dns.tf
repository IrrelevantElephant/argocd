# resource "ns1_zone" "todo_zone" {
#   zone = "todoapp.irrelevantelephant.co.uk"
# }

# resource "ns1_record" "www_todoapp" {
#   zone   = ns1_zone.todo_zone.zone
#   domain = "todoapp.irrelevantelephant.co.uk"
#   type   = "A"
#   answers {
#     answer = "51.159.205.213"
#   }
# }
