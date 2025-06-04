app.controller('superDashboardCtrl', function($scope , $http, $timeout , DBService, Upload,$interval) {

});


app.controller('clientsCtrl', function($scope , $http, $timeout , DBService, Upload,$interval) {
    $scope.clients = [];
    $scope.client = {
        services: [{demo:''}],
    };
    $scope.client_id = 0;

    $scope.init = function(){
        DBService.postCall({}, '/api/superAdmin/get-clients').then((data) => {
            if (data.success) {
                $scope.clients = data.clients;
            }
        });
    }    

    $scope.addClient = function(){
        DBService.postCall({client_id: $scope.client_id}, '/api/superAdmin/edit-init').then((data) => {
            if (data.success) {
                $scope.client = data.client;
            } else {

            }
            $scope.services = data.services;
        });
    }    


    $scope.addService = function(){
        $scope.client.services.push({demo:''});
    }

    $scope.removeService = function(index) {
        if(confirm("Are you sure?") == true){
            $scope.client.services.splice(index, 1);
        };
    }


    $scope.storeClient = function(){
        DBService.postCall($scope.client, '/api/superAdmin/store-client').then((data) => {
            alert(data.message);
            if (data.success) {
                $scope.addClient();
            }
        });
    }

});

app.controller('shiftCtrl', function($scope , $http, $timeout , DBService) {
    $scope.loading= false;
    $scope.sitting_data = [];
    $scope.cloak_data = [];
    $scope.canteen_data = [];
    $scope.massage_data = [];
    $scope.locker_data = [];
    $scope.recliner_data = [];
    $scope.scanning_data = [];
    $scope.pod_data = [];
    $scope.singal_cabin_data = [];
    $scope.double_bed_data = [];
    $scope.rest_data = [];
    $scope.service_ids = [];
    $scope.clients = [];
    $scope.filter = {
        input_date:'',
        user_id:'',
        client_id:'',
    }

    $scope.clear = function(){
        $scope.filter = {
            input_date:'',
            user_id:'',
            client_id:'',
        }
        $scope.init();
    }
    $scope.changeFilter = function(){
        $scope.filter.user_id = '',
        $scope.init();
    }
    $scope.serach = function(){
        $scope.init();
    }

    $scope.users  = [];

    $scope.init = function () {
        $scope.loading = false;
        DBService.postCall($scope.filter, '/api/shift/init').then((data) => {
            if (data.success) { 

                $scope.users = data.users;                 
                $scope.clients = data.clients;                 
                $scope.service_ids = data.service_ids;                 
                
                $scope.sitting_data = data.sitting_data; 
                $scope.cloak_data = data.cloak_data; 
                $scope.canteen_data = data.canteen_data; 
                $scope.massage_data = data.massage_data;
                $scope.locker_data = data.locker_data;
                $scope.recliner_data = data.recliner_data;
                $scope.scanning_data = data.scanning_data;
                $scope.pod_data = data.pod_data;
                $scope.singal_cabin_data = data.singal_cabin_data;
                $scope.double_bed_data = data.double_bed_data;
                $scope.rest_data = data.rest_data;
               
                $scope.total_shift_upi = data.total_shift_upi ; 
                $scope.total_shift_cash = data.total_shift_cash ; 
                $scope.total_collection = data.total_collection ; 

                $scope.last_hour_upi_total = data.last_hour_upi_total ; 
                $scope.last_hour_cash_total = data.last_hour_cash_total ; 
                $scope.last_hour_total = data.last_hour_total ;
                $scope.change_data = data.chage_pay_type_data ;
                
                $scope.check_shift = data.check_shift ; 
                $scope.shift_date = data.shift_date ; 
            }
            $scope.loading = true;
        });
    }    

    
});

app.controller('userCtrl', function($scope , $http, $timeout , DBService) {
    $scope.loading = false;
    $scope.add_new_flag = false;
    $scope.formData = {
        name:'',
        email:'',
        mobile:'',
        password:'',
        confirm_password:'',
    };
    $scope.filter = {};
    $scope.user_id = 0;
    $scope.users = [];
 
    $scope.init = function () {
        DBService.postCall($scope.filter, '/api/users/init').then((data) => {
            $scope.users = data.users;
            $scope.add_new_flag = data.add_new_flag;
        });
    }
    $scope.filterClear = function(){
        $scope.filter = {};
        $scope.init();
    }

    $scope.edit = function(user_id){
        $scope.user_id = user_id;
        DBService.postCall({user_id : $scope.user_id}, '/api/users/edit-init').then((data) => {
            if (data.success) {
                $scope.formData = data.user;
                $("#userModal").modal("show");
            }
        });
    }

    $scope.activeUser = function(user,index){
        if(confirm("Are you sure?") == true){
             DBService.postCall({user_id : user.id}, '/api/users/active-user').then((data) => {
                if (data.success) {
                    $scope.users[index].active = user.active == 0 ? 1 :0; 
                }
                alert(data.message);
            });
        }
    }

    $scope.hideModal = () => {
        $("#userModal").modal("hide");
        $scope.user_id = 0;
        $scope.formData = {
            name:'',
            email:'',
            mobile:'',
            password:'',
            confirm_password:'',
        };
        $scope.init();
    }

    $scope.add = () => {
        $("#userModal").modal("show");
        $scope.user_id = 0;
        $scope.formData = {
            name:'',
            email:'',
            mobile:'',
            password:'',
            confirm_password:'',
        };
    }

    $scope.onSubmit = function () {
        $scope.loading = true;
        DBService.postCall($scope.formData, '/api/users/store').then((data) => {
            if (data.success) {
                alert(data.message);
                $("#userModal").modal("hide");
                $scope.formData = {
                    name:'',
                    email:'',
                    mobile:'',
                    password:'',
                    confirm_password:'',
                };
                $scope.init();
            }else{
                alert(data.message);
            }
            $scope.loading = false;
        });
    }
});