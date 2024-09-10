<template>
  <div>
    <h2 id="a">Flight List</h2>
    <el-table :data="flights" style="width: 80%;;margin: 0 auto;">

      <el-table-column prop="Flight No" label="Flight No."/>
      <el-table-column prop="Airline Company" label="Airline Company"/>
      <el-table-column prop="From" label="From"/>
      <el-table-column prop="To" label="To"/>
      <el-table-column prop="Date" label="Date"/>
      <el-table-column prop="Departure Time" label="Departure Time"/>
      <el-table-column prop="Arrival Time" label="Arrival Time"/>
      <el-table-column label="Operations">
        <template #default="scope">
          <el-button type="info" @click="deleteFlight(scope.$index)">Delete</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-button style="margin-left: 45%; margin-top: 20px" type="primary" @click="createNewFight">Add New Flight</el-button>


    <el-dialog
      :visible.sync="dialogVisible"
      title="Add A New Flight"
      width="40%"
    >
      <el-form
        ref="FlightForm"
        :model="FlightForm"
        :rules="rules"
        label-width="auto"
        label-position="right"
        size="default"
      >
        <el-form-item label="Flight No." prop="FlightNo">
          <el-input v-model="FlightForm.FlightNo"/>
        </el-form-item>
        <el-form-item label="Airline Company" prop="AirlineCompany">
          <el-input v-model="FlightForm.AirlineCompany"/>
        </el-form-item>
        <el-form-item label="From" prop="From">
          <el-input v-model="FlightForm.From"/>
        </el-form-item>
        <el-form-item label="To" prop="To">
          <el-input v-model="FlightForm.To"/>
        </el-form-item>

        <el-form-item label="Date" prop="Date">
          <el-date-picker
            value-format='yyyy/mm/dd'
            v-model="FlightForm.Date"
            type="date"
            label="Pick a date"
            placeholder="Pick a date"
            style="width: 100%"
          />
        </el-form-item>
        <el-form-item label="Departure Time" prop="DepartureTime">
          <el-time-picker
            format='HH:mm'
            value-format='HH:mm'
            v-model="FlightForm.DepartureTime"
            label="Pick a time"
            placeholder="Pick a time"
            style="width: 100%"
          />
        </el-form-item>
        <el-form-item label="Arrive Time" prop="ArriveTime">
          <el-time-picker
            format='HH:mm'
            value-format='HH:mm'
            v-model="FlightForm.ArriveTime"
            label="Pick a time"
            placeholder="Pick a time"
            style="width: 100%"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="AddFlight('FlightForm')">Create</el-button>
        </el-form-item>

      </el-form>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'FlightTable',
  data() {
    const flightNoValidator = (rule, value, callback) => {
      const re = /^[A-Z0-9]{2}\d{3,4}$/;
      if (!value) {
        return callback(new Error('Please input flight No.'));
      }
      if (!re.test(value)) {
        return callback(new Error('Invalid Flight No.'));
      }
      callback();
    };
    const airportCodeValidator = (rule, value, callback) => {
      const re = /^[A-Z]{3}$/;
      if (!value) {
        callback(new Error('Please input origin/destination airport code'));
      }
      if (!re.test(value)) {
        return callback(new Error('Invalid origin/destination airport code'));
      }
      callback();
    };
    return {
      flights: [
        {
          "Flight No": "ZH1858",
          "Airline Company": "Shenzhen Airlines",
          "From": "SHA",
          "To": "PEK",
          "Date": "2020/09/25",
          "Departure Time": "07:55",
          "Arrival Time": "10:10"
        },
        {
          "Flight No": "MU5479",
          "Airline Company": "Eastern Airlines",
          "From": "TAO",
          "To": "WUH",
          "Date": "2020/09/25",
          "Departure Time": "13:40",
          "Arrival Time": "15:55"
        },
        {
          "Flight No": "CA5795",
          "Airline Company": "Air China",
          "From": "KMG",
          "To": "CKG",
          "Date": "2020/09/20",
          "Departure Time": "06:50",
          "Arrival Time": "08:25"
        },
        {
          "Flight No": "HU7707",
          "Airline Company": "Hainan Airlines",
          "From": "PEK",
          "To": "SZX",
          "Date": "2020/09/20",
          "Departure Time": "22:00",
          "Arrival Time": "01:30+1"
        },
        {
          "Flight No": "SC4837",
          "Airline Company": "Shandong Airlines",
          "From": "CKG",
          "To": "TAO",
          "Date": "2020/09/20",
          "Departure Time": "07:00",
          "Arrival Time": "09:25"
        },
      ],
      FlightForm: {
        FlightNo: "",
        AirlineCompany: "",
        From: "",
        To: "",
        Date: "",
        DepartureTime: "",
        ArriveTime: ""
      },
      rules: {
        FlightNo: [
          {validator: flightNoValidator, trigger: 'blur'},
          {required: true, trigger: true}
        ],
        AirlineCompany: [
          {required: true, message: 'Please input Airline Company', trigger: 'blur'},
        ],
        From: [
          {validator: airportCodeValidator, trigger: 'blur'},
          {required: true, trigger: true}
        ],
        To: [
          {validator: airportCodeValidator, trigger: 'blur'},
          {required: true, trigger: true}
        ],
        Date: [
          {required: true, message: 'Please select the date of flight', trigger: 'blur'},
        ],
        DepartureTime: [
          {required: true, message: 'Please select the departure time of flight', trigger: 'blur'},
        ],
        ArriveTime: [
          {required: true, message: 'Please select the arrival time of flight', trigger: 'blur'},
        ]
      },
      dialogVisible: false
    }
  },
  methods: {
    createNewFight() {
      // console.log(this.dialogVisible)
      this.dialogVisible = true
      // console.log(this.dialogVisible)
    },
    deleteFlight(index) {
      this.flights.splice(index, 1)
    },
    AddFlight(formName) {
      console.log(this.FlightForm.Date)
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.flights.push({
            "Flight No": this.FlightForm.FlightNo,
            "Airline Company": this.FlightForm.AirlineCompany,
            "From": this.FlightForm.From,
            "To": this.FlightForm.To,
            "Date": this.FlightForm.Date,
            "Departure Time": this.FlightForm.DepartureTime,
            "Arrival Time": this.FlightForm.ArriveTime
          })
          alert('submit!')
          this.dialogVisible = false
        } else {
          console.log("Add Fail");
        }
      })
    }
  }

}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
#a {
  text-align: center;
  font-size: 20px;
  font-style: italic;
  margin: 20px;
}

</style>
