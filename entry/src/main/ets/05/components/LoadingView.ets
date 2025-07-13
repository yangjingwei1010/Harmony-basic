
@Preview
@Component
struct LoadingView {
  @State value: number = 0
  timer: number = -1

  aboutToAppear(): void {
    // 开启定时器
    this.timer = setInterval(() => {
      this.value++
      if (this.value === 100) {
        this.value = 0
      }
    }, 10)
  }
  aboutToDisappear(): void {
    clearInterval(this.timer)
  }
  build() {
    Progress({
      type: ProgressType.Ring,
      total: 100,
      value: this.value
    })
  }
}

export default LoadingView