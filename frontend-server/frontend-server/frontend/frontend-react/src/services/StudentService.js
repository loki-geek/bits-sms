import axios from 'axios';
const ip_backend = 'https://backend-clb-511353292.ap-south-1.elb.amazonaws.com/students/'
export function getStudents() {
  return axios.get(ip_backend)
    .then(response => response.data)
}

export function deleteStudent(studentId) {
  return axios.delete(ip_backend + studentId + '/', {
   method: 'DELETE',
   headers: {
     'Accept':'application/json',
     'Content-Type':'application/json'
   }
  })
  .then(response => response.data)
}

export function addStudent(student){
  return axios.post(ip_backend, {
    studentId:null,
    FirstName:student.FirstName.value,
    LastName:student.LastName.value,
    RegistrationNo:student.RegistrationNo.value,
    Email:student.Email.value,
    Course:student.Course.value
  })
    .then(response=>response.data)
}

export function updateStudent(stuid, student) {
  return axios.put(ip_backend + stuid + '/', {
    FirstName:student.FirstName.value,
    LastName:student.LastName.value,
    RegistrationNo:student.RegistrationNo.value,
    Email:student.Email.value,
    Course:student.Course.value
  })
   .then(response => response.data)
}


