import { PlayNavCom } from './component/PlayNavCom';
import { WechatConsumeCom } from './component/WechatConsumeCom';

@Entry
@Component
struct ProvideDemoPage {
  @Provide
  isPlay: boolean = false
  @State
  message: string = 'Hello World';
  @State
  currentIndex: number = 0

  @State
  list: TabInterface1[] = [{
    icon: $r("app.media.ic_public_message"),
    selectIcon: $r('app.media.ic_public_message_filled'),
    name: 'wechat',
    title: '微信',
  }, {
    icon: $r('app.media.ic_public_contacts_group'),
    selectIcon: $r('app.media.ic_public_contacts_group_filled'),
    name: 'connect',
    title: '联系人',
  }, {
    icon: $r('app.media.ic_gallery_discover'),
    selectIcon: $r('app.media.ic_gallery_discover_filled'),
    name: 'discover',
    title: '发现',
  }, {
    icon: $r('app.media.ic_public_contacts'),
    selectIcon: $r('app.media.ic_public_contacts_filled'),
    name: 'my',
    title: '我的',
  }]
  @Builder
  tabBarItem(item: TabInterface1) {
    Column({space: 6}) {
      Image(item.name === this.list[this.currentIndex].name ? item.selectIcon : item.icon)
        .width(20)
      Text(item.title)
        .fontSize(12)
        .fontColor(item.name === this.list[this.currentIndex].name ? '#1AAD19' : '#2A2929')
    }
  }

  build() {
    Row() {
      Stack({alignContent: Alignment.Bottom}) {
        Tabs({index: $$this.currentIndex}) {
          ForEach(this.list, (item: TabInterface1) => {
            TabContent() {
              if (item.name === 'wechat') {
                WechatConsumeCom()
              } else if (item.name === 'connect') {
                WechatConsumeCom()
              }
            }
            .tabBar(this.tabBarItem(item))
          })
        }
        .barPosition(BarPosition.End)
        PlayNavCom()
          .translate({
            y: -60
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

interface TabInterface1 {
  name: string
  icon: ResourceStr
  selectIcon: ResourceStr
  title: string
}