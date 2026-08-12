rg1 ={
    rg1 ={
        name = "sheetalrgprepod"
        location = "westus"
    }
     rg2 ={
        name = "sheetalrgprepod2"
        location = "westus"
    }
     rg3 ={
        name = "sheetalrgprepod3"
        location = "westus"
    }
}
sto1 ={
    sto11= { 
        name = "myboxshprepod"
    location = "eastus"
    resource_group_name = "sheetalrgprepod"
    account_tier= "Standard"
    account_replication_type= "LRS"
}
}