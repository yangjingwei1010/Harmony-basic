@Entry
@Component
struct Build3Page {
  @State
  formData: FormData = {
    name: '张三',
    age: '18',
    bank: '中国银行',
    money: '999'
  }
  @Builder
  FormBuilder($$:FormDataInfo) {
    Column({ space: 20 }) {
      TextInput({ placeholder: '请输入姓名',text:$$.data.name})
      TextInput({ placeholder: '请输入年龄',text:$$.data.age})
      TextInput({ placeholder: '请输入银行',text:$$.data.bank })
      TextInput({ placeholder: '请输入银行卡余额',text:$$.data.money})
    }.width('100%')
  }
  build() {
    Row() {
      Column({space:20}) {
        Text(JSON.stringify(this.formData))
        this.FormBuilder({
          data:this.formData
        })
        Row({space:20}){
          Button('重置')
            .onClick(()=>{
              this.formData = {
                name: '',
                age: '',
                bank: '',
                money: ''
              }
            })
          Button('注册')
        }
      }
      .width('100%')
      .padding(20)
    }
    .height('100%')
  }
}

interface FormData {
  name: string
  age: string
  bank: string
  money: string
}
interface FormDataInfo{
  data:FormData
}