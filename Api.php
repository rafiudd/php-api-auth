<?php 
 
 require_once 'DBhost.php';
 
 $response = array();
 
 if(isset($_GET['apicall'])){
 
        switch($_GET['apicall']){
            case 'signup':
                if(isTheseParametersAvailable(array('email','password','status','level'))){
                $email = $_POST['email']; 
                $password = md5($_POST['password']);
                $status = $_POST['status'];
                $level = $_POST['level']; 
                
                $stmt = $conn->prepare("SELECT email,password,status,level FROM user WHERE  email = ?");
                $stmt->bind_param("s",$email);
                $stmt->execute();
                $stmt->store_result();
                
                if($stmt->num_rows > 0){
                    $response['error'] = true;
                    $response['message'] = 'User already registered';
                    $stmt->close();
                }else{
                    $stmt = $conn->prepare("INSERT INTO user (email, password, status,level) VALUES (?, ?, ?, ?)");
                    $stmt->bind_param("ssss", $email, $password, $status,$level);
                    
                    if($stmt->execute()){
                        $stmt = $conn->prepare("SELECT id, email, password, status, level FROM user WHERE email = ?"); 
                        $stmt->bind_param("s",$email);
                        $stmt->execute();
                        $stmt->bind_result($id,$email,$password,$status,$level);
                        $stmt->fetch();
                        
                        $user = array(
                            'id'=>$id, 
                            'email'=>$email,
                            'password'=>$password,
                            'status'=>$status,
                            'level'=>$level
                        );
                        $stmt->close();
                        
                        $response['error'] = false; 
                        $response['message'] = 'User registered successfully'; 
                        $response['user'] = $user; 
                    }
                }
            }else{
                $response['error'] = true; 
                $response['message'] = 'required parameters are not available'; 
            }
        break;
        case 'edit':
                if(isTheseParametersAvailable(array('email','password','status','level'))){
                $email = $_POST['email']; 
                $password = md5($_POST['password']);
                $status = $_POST['status'];
                $level = $_POST['level']; 
                
                $stmt = $conn->prepare("SELECT email,password,status,level FROM user WHERE email=?");
                $stmt->bind_param("s",$email);
                $stmt->execute();
                $stmt->store_result();
                
                if($stmt->num_rows > 0){
                    $stmt = $conn->prepare("UPDATE user SET password=?, status=?, level=? WHERE  email=?");
                    $stmt->bind_param("ssss", $password, $status, $level, $email);
                    
                    if($stmt->execute()){
                        $stmt = $conn->prepare("SELECT id, email, password, status, level FROM user WHERE email=?"); 
                        $stmt->bind_param("s",$email);
                        $stmt->execute();
                        $stmt->bind_result($id,$email,$password,$status,$level);
                        $stmt->fetch();
                        
                        $user = array(
                            'id'=>$id, 
                            'email'=>$email,
                            'password'=>$password,
                            'status'=>$status,
                            'level'=>$level
                        );
                        $stmt->close();
                        
                        $response['error'] = false; 
                        $response['message'] = 'User edited successfully'; 
                        $response['user'] = $user; 
                    }
                }else{
                    $response['error'] = true;
                    $response['message'] = 'User not found';
                    $stmt->close();
                }
            }else{
                $response['error'] = true; 
                $response['message'] = 'required parameters are not available'; 
            }
        break;
        case 'login':
            if(isTheseParametersAvailable(array('email', 'password','status','level'))){
                $email = $_POST['email']; 
                $password = md5($_POST['password']);
                $status = $_POST['status'];
                $level = $_POST['level'];
                
                $stmt = $conn->prepare("SELECT id, email,password,status,level FROM user WHERE email = ? AND password = ? AND status = ? AND level = ?");
                $stmt->bind_param("ssss",$email, $password,$status,$level);
                
                $stmt->execute();
                
                $stmt->store_result();
        
                if($stmt->num_rows > 0){
                    $stmt->bind_result($id, $email,$password, $status,$level);
                    $stmt->fetch();
                    
                    $user = array(
			'id'=>$id,
                   	'email'=>$email,
                    	'password'=>$password,
                    	'status'=>$status,
                    	'level'=>$level
                    );
                   
                    $response['error'] = false; 
                    $response['message'] = 'Login successfull'; 
                    $response['user'] = $user; 
                }else{
                    $response['error'] = false; 
                    $response['message'] = 'Invalid username or password';
                }
            }
        break; 
        case 'edit':
                if(isTheseParametersAvailable(array('email','password','status','level'))){
                $email = $_POST['email']; 
                $password = md5($_POST['password']);
                $status = $_POST['status'];
                $level = $_POST['level']; 
                
                $stmt = $conn->prepare("SELECT email,password,status,level FROM user WHERE email=?");
                $stmt->bind_param("s",$email);
                $stmt->execute();
                $stmt->store_result();
                
                if($stmt->num_rows > 0){
                    $stmt = $conn->prepare("UPDATE user SET password=?, status=?, level=? WHERE  email=?");
                    $stmt->bind_param("ssss", $password, $status, $level, $email);
                    
                    if($stmt->execute()){
                        $stmt = $conn->prepare("SELECT id, email, password, status, level FROM user WHERE email=?"); 
                        $stmt->bind_param("s",$email);
                        $stmt->execute();
                        $stmt->bind_result($id,$email,$password,$status,$level);
                        $stmt->fetch();
                        
                        $user = array(
                            'id'=>$id, 
                            'email'=>$email,
                            'password'=>$password,
                            'status'=>$status,
                            'level'=>$level
                        );
                        $stmt->close();
                        
                        $response['error'] = false; 
                        $response['message'] = 'User edited successfully'; 
                        $response['user'] = $user; 
                    }
                }else{
                    $response['error'] = true;
                    $response['message'] = 'User not found';
                    $stmt->close();
                }
            }else{
                $response['error'] = true; 
                $response['message'] = 'required parameters are not available'; 
            }
        break;
        default: 
            $response['error'] = true; 
            $response['message'] = 'Invalid Operation Called';
    }
 }else{
    $response['error'] = true; 
    $response['message'] = 'Invalid API Call';
 }
 
 echo json_encode($response); //sudah ada ini, sesuai format android di tutorial
 
 function isTheseParametersAvailable($params){
    foreach($params as $param){
        if(!isset($_POST[$param])){
            return false; 
        }
    }
    return true; 
 }
