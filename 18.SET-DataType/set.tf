/*
variable "my-list" {
    type = list
    default = ["hello","world","hello"]
}

output "my-list" {
    value = var.my-list[0]
}
*/


variable "my-set" {
    type = set(string)
    default = ["zebra","john","alice", "bob"]
}

output "my-set" {
    value = var.my-set
    
}


/*
list - allows duplicate values. order of the elements will change, when we add new element in the middle or starting etc.
set - allows unique values. Even if duplicate values exists, it won't show any error. But it will don't consider the duplicate value.
In set, order of the elements won't change, even if we add new element in the middle or starting etc.
*/