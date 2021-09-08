//
//  Post.swift
//  Navigation
//
//  Created by Simon Pegg on 05.09.2021.
//

import UIKit

struct PostBody {
    let title: String
    let image: UIImage
    let description: String
    var likes: Int
    var views: Int
}

struct PostAtributes {
    let sectionHeader: UITableViewHeaderFooterView?
    let body: [PostBody]
    var footer: String? = nil
}
let header: ProfileTableHeaderView = {
   let view = ProfileTableHeaderView()
    return view
}()

struct PostStorage {
    static let tableModel = [
        PostAtributes(sectionHeader: header,
                      body: [
                        PostBody(title: "Россияне в августе взяли рекордный объем потребкредитов", image: UIImage(named: "Photo1")!, description: "В августе рынок необеспеченного кредитования в России снова оживился после временного замедления в июле, следует из предварительных расчетов Frank RG (есть у РБК). Банки одобрили гражданам 2,1 млн кредитов наличными на 646,7 млрд руб., обновив рекорд по выдачам в этом сегменте, поставленный в апреле. По сравнению с июлем количество новых договоров выросло на 7,5%, а объем одобренных ссуд — на 6,9%", likes: 22, views: 111),
                        PostBody(title: "Борис Джонсон повысит налоги, в том числе на дивиденды", image: UIImage(named: "Photo2")!, description: "Премьер-министр Великобритании Борис Джонсон объявил во вторник о планах повышения налогов для финансирования здравоохранения и реформы системы социального обеспечения страны, пишет CNBC. Предполагается повышение ставки национального страхования в Великобритании (это текущий подоходный налог) на 1,25%, который станет отдельным налогом на трудовой доход в 2023 году, а также повышение налога на дивидендный доход акционеров.", likes: 12, views: 644),
                        PostBody(title: "Segezha рассматривает международный листинг, наращивая активы", image: UIImage(named: "Photo3")!, description: "Российский вертикально-интегрированный лесопромышленный холдинг Segezha, не так давно вышедший на рынки акционерного капитала, может рассмотреть международный листинг в конце 2022 года - в 2023 году, сказал Рейтер вице-президент компании по финансам и инвестициям Ровшан Алиев.\"По мере того, как мы будем расти, мы будем смотреть на dual listing по акциям. На данном этапе я не вижу необходимости, но мы можем вернуться к этому вопросу к концу 2022 года - в начале 2023\", - сказал Алиев.", likes: 255, views: 808),
                        PostBody(title: "Доллар в плюсе за счет роста доходности гособлигаций США", image: UIImage(named: "Photo4")!, description: "Доллар во вторник растет второй день подряд, отступая от почти месячного минимума, достигнутого на прошлой неделе, поскольку подъем доходности казначейских облигаций США побудил инвесторов сократить короткие позиции в паре доллар/евро перед заседанием Европейского центрального банка на этой неделе.Американская валюта в пятницу опустилась до минимальных уровней с начала августа после неожиданно слабого отчета о занятости в США, который заставил аналитиков повысить ставки на то, что Федеральная резервная система не будет сворачивать стимулы в ближайшие месяцы.", likes: 203, views: 901),
                      ] )
                      
    ]
}