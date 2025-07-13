import { ImageSelectBuilder } from './builders/ImageSelectIcon'
import { MyCustomDialog } from './components/MyCustomDialog'
import { ImageListComponent } from './components/ImageListcomponent'


@Entry
@Component
struct ImageSelectPage {
  @State
  selectedList: ResourceStr[] = []
  myCustomDialog: CustomDialogController = new CustomDialogController({
    builder: MyCustomDialog({
      selectList: this.selectedList
    }),
    customStyle: true
  })
  @State
  showDialog: boolean = false

  // 局部builder，因为涉及到状态变化
  @Builder
  imageListBuilder() {
    // 大坑 最外层必须得是容器组件
    Row() {
      ImageListComponent({
        selectedList: this.selectedList,
        showDialog: this.showDialog,
        maxNumber: 8
      })
    }
  }


  build() {
    Grid() {
      ForEach(this.selectedList, (item: ResourceStr) => {
        GridItem() {
          Image(item)
            .width('100%')
            .aspectRatio(1)
        }
        .onClick(() => {
          this.myCustomDialog.open()
        })
      })
      // 加号按钮
      GridItem() {
        ImageSelectBuilder()
      }
      .onClick(() => {
        // 展示碳层
        //
        this.showDialog = true
      })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .columnsTemplate('1fr 1fr 1fr')
    .columnsGap(10)
    .rowsGap(10)
    .bindSheet($$this.showDialog, this.imageListBuilder(), {
      showClose: false,
      height: '90%'
    })
  }
}