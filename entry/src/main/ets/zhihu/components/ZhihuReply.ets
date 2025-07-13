@Component
struct ZhihuReply {
  @State content: string = ''
  publishComment: (content: string) => void = () => {}

  build() {
    Row() {
      TextInput({placeholder: '回复', text: $$this.content})
        .layoutWeight(1)
        .height(40)
        .onSubmit(() => {
          if (this.content) {
            this.publishComment(this.content)
            this.content = ''
          }
        })
      Button('发布')
        .onClick(() => {
          if (this.content) {
            this.publishComment(this.content)
            this.content = ''
          }
        })
    }
    .width('100%')
    .padding({
      left: 10,
      right: 10
    })
    .height(40)
  }
}

export {
  ZhihuReply
}