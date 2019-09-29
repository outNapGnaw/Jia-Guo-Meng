const Line1arr = [[320, 770], [560, 630], [815, 470]]
const Line2arr = [[307, 970], [560, 840], [820, 720]]
const Line3arr = [[320, 1200], [560, 1100], [820, 920]]
const Train = [[670, 1640], [840, 1590], [950, 1500]]
const AllBuildings = Line1arr.concat(Line2arr).concat(Line3arr)
const jgmPkgName = 'com.tencent.jgm'
const swipeDelay = 400
const swipeSleep = 400
const uploadDelay = 1000
const totalLoopCount = 10000000000000000
auto()
launch(jgmPkgName)
//等待启动成功
sleep(6000)
function uploadPkg() {
    AllBuildings.forEach(build => {
        const [buildx, buildy] = build
        Train.forEach(tra => {
            const [trax, tray] = tra
            // 点击一下 防止弹窗影响
            press(trax, tray, 10)
            swipe(trax, tray, buildx, buildy, swipeDelay)
            sleep(swipeSleep)
        })
    })
}
function start() {
    for (let index = 1; index < totalLoopCount; index++) {
        toast('第'+index+'次 上货')
        uploadPkg()
        sleep(uploadDelay)
    }
}

start()
