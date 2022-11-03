//
//  Stats_View.swift
//  Gotcha
//
//  Created by Blake Ankner on 9/30/22.
//
import SwiftUI

struct Stats_View: View {
    
    var widthModifier: Float = 7.5
    @State private var allMonTags: Int = 0
    @State private var allTueTags: Int = 0
    @State private var allWedTags: Int = 0
    @State private var allThuTags: Int = 0
    @State private var allFriTags: Int = 0
    
    @State private var classI_Tags: Int = 0
    @State private var classII_Tags: Int = 0
    @State private var classIII_Tags: Int = 0
    @State private var classVI_Tags: Int = 0
    
    @State private var dayMon_Tags: Int = 0
    @State private var dayTue_Tags: Int = 0
    @State private var dayWed_Tags: Int = 0
    @State private var dayThu_Tags: Int = 0
    @State private var dayFri_Tags: Int = 0
    
    @State private var boarderMon_Tags: Int = 0
    @State private var boarderTue_Tags: Int = 0
    @State private var boarderWed_Tags: Int = 0
    @State private var boarderThu_Tags: Int = 0
    @State private var boarderFri_Tags: Int = 0
    
    var body: some View {
        List{
            HStack{ //Page Title
                Text("Stats")
                    .font(Font.title2.bold())
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color("white").opacity(0.0))
            
            
            //ALL TAGS START
            HStack{
                Text("All Tags")
                    .font(Font.subheadline.bold())
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color("white").opacity(0.0))
            
            VStack(alignment: .leading){ //TAG ALL
                Spacer().frame(maxWidth: .infinity)
                HStack(alignment: .bottom){
                    VStack{ //Monday
                        Text("\(allMonTags)")
                            .foregroundColor(Color("acid"))
                            .font(Font.footnote.bold())
                        Rectangle()
                            .frame(width: UIScreen.screenWidth/13, height: CGFloat(allMonTags)/4)
                            .foregroundColor(Color("acid"))
                            .cornerRadius(UsefulValues.cornerRadius/4)
                        Text("M")
                            .font(Font.subheadline.italic())
                            .foregroundColor(Color("titleGrey"))
                    }
                    .padding()
                    VStack{ //Tuesday
                        Text("\(allTueTags)")
                            .font(Font.footnote.bold())
                            .foregroundColor(Color("rose"))
                        Rectangle()
                            .frame(width: UIScreen.screenWidth/13, height: CGFloat(allTueTags)/4)
                            .foregroundColor(Color("rose"))
                            .cornerRadius(UsefulValues.cornerRadius/4)
                        Text("T")
                            .font(Font.subheadline.italic())
                            .foregroundColor(Color("titleGrey"))
                    }
                    .padding()
                    VStack{ //Wednesday
                        Text("\(allWedTags)")
                            .font(Font.footnote.bold())
                            .foregroundColor(Color("lavender"))
                        Rectangle()
                            .frame(width: UIScreen.screenWidth/13, height: CGFloat(allWedTags)/4)
                            .foregroundColor(Color("lavender"))
                            .cornerRadius(UsefulValues.cornerRadius/4)
                        Text("W")
                            .font(Font.subheadline.italic())
                            .foregroundColor(Color("titleGrey"))
                    }
                    .padding()
                    VStack{ //Thursday
                        Text("\(allThuTags)")
                            .font(Font.footnote.bold())
                            .foregroundColor(Color("bubblegum"))
                        Rectangle()
                            .frame(width: UIScreen.screenWidth/13, height: CGFloat(allThuTags)/4)
                            .foregroundColor(Color("bubblegum"))
                            .cornerRadius(UsefulValues.cornerRadius/4)
                        Text("T")
                            .font(Font.subheadline.italic())
                            .foregroundColor(Color("titleGrey"))
                    }
                    .padding()
                    VStack{ //Friday
                        Text("\(allFriTags)")
                            .font(Font.footnote.bold())
                            .foregroundColor(Color("bahama_beach"))
                        Rectangle()
                            .frame(width: UIScreen.screenWidth/13, height: CGFloat(allFriTags)/4)
                            .foregroundColor(Color("bahama_beach"))
                            .cornerRadius(UsefulValues.cornerRadius/4)
                        Text("F")
                            .font(Font.subheadline.italic())
                            .foregroundColor(Color("titleGrey"))
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
            } //END Tag all VStack
            .frame(width: UIScreen.screenWidth/1.2, height: UIScreen.screenHeight/5)
            .padding()
            .background(Color("darkGrey"))
            .cornerRadius(UsefulValues.cornerRadius)
            .listRowSeparator(.hidden)
            .listRowBackground(Color("white").opacity(0.0))
            .listRowInsets(EdgeInsets()) // << avoid extra space
            .listStyle(GroupedListStyle())
            //ALL TAGS END
            
            
            //CLASS TAGS START
            HStack{
                Text("Class Tags")
                    .font(Font.subheadline.bold())
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color("white").opacity(0.0))
            
            HStack (alignment: .center){//EACH CLASS
                VStack{ //Class I VStack
                    HStack{
                        Text("I")
                            .font(Font.title2.bold())
                            .padding(.leading, 3)
                        Spacer()
                    }
                    Spacer()
                    Text("\(classI_Tags)")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color("titleGrey"))
                    Spacer()
                    Text("Total")
                        .font(Font.caption.italic())
                        .foregroundColor(Color("titleGrey"))
                } //END Class I VStack
                .frame(width: .infinity, height: .infinity)
                .padding()
                .background(Color("darkGrey"))
                .cornerRadius(UsefulValues.cornerRadius)
                
                VStack{ //Class III VStack
                    HStack{
                        Text("II")
                            .font(Font.title2.bold())
                            .padding(.leading, 3)
                        Spacer()
                    }
                    Spacer()
                    Text("\(classII_Tags)")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color("titleGrey"))
                    Spacer()
                    Text("Total")
                        .font(Font.caption.italic())
                        .foregroundColor(Color("titleGrey"))
                } //END Class II VStack
                .frame(width: .infinity, height: .infinity)
                .padding()
                .background(Color("darkGrey"))
                .cornerRadius(UsefulValues.cornerRadius)
                
                VStack{ //Class III VStack
                    HStack{
                        Text("III")
                            .font(Font.title2.bold())
                            .padding(.leading, 3)
                        Spacer()
                    }
                    Spacer()
                    Text("\(classIII_Tags)")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color("titleGrey"))
                    Spacer()
                    Text("Total")
                        .font(Font.caption.italic())
                        .foregroundColor(Color("titleGrey"))
                } //END Class III VStack
                .frame(width: .infinity, height: .infinity)
                .padding()
                .background(Color("darkGrey"))
                .cornerRadius(UsefulValues.cornerRadius)
                
                VStack{ // Class VI VStack
                    HStack{
                        Text("VI")
                            .font(Font.title2.bold())
                            .padding(.leading, 3)
                        Spacer()
                    }
                    Spacer()
                    Text("\(classVI_Tags)")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color("titleGrey"))
                    Spacer()
                    Text("Total")
                        .font(Font.caption.italic())
                        .foregroundColor(Color("titleGrey"))
                } //END Class VI VStack
                .frame(width: .infinity, height: .infinity)
                .padding()
                .background(Color("darkGrey"))
                .cornerRadius(UsefulValues.cornerRadius)
            } //END Each Class Section
            .frame(maxWidth: UIScreen.screenWidth, maxHeight: UIScreen.screenHeight/3)
            .listRowSeparator(.hidden)
            .listRowBackground(Color("white").opacity(0.0))
            .listRowInsets(EdgeInsets()) // << avoid extra space
            .listStyle(GroupedListStyle())
            //CLASS TAGS START
            
            
            //DAY v. BOARDER START
            HStack{
                Text("Day v. Boarder")
                    .font(Font.subheadline.bold())
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color("white").opacity(0.0))
            HStack{ //DAY v. BOARDER
                VStack{ //Day
                    VStack{
                        Spacer().frame(maxWidth: .infinity)
                        HStack(alignment: .bottom){
                            VStack{ //Monday
                                Text("\(dayMon_Tags)")
                                    .font(Font.caption.bold())
                                    .foregroundColor(Color("acid"))
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(dayMon_Tags)/6)
                                    .foregroundColor(Color("acid"))
                                    .cornerRadius(UsefulValues.cornerRadius/6)
                                Text("M")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                            VStack{ //Tuesday
                                Text("\(dayTue_Tags)")
                                    .foregroundColor(Color("rose"))
                                    .font(Font.caption.bold())
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(dayTue_Tags)/6)
                                    .foregroundColor(Color("rose"))
                                    .cornerRadius(UsefulValues.cornerRadius/6)
                                Text("T")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                            VStack{ //Wednesday
                                Text("\(dayWed_Tags)")
                                    .foregroundColor(Color("lavender"))
                                    .font(Font.caption.bold())
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(dayWed_Tags)/6)
                                    .foregroundColor(Color("lavender"))
                                    .cornerRadius(UsefulValues.cornerRadius/6)
                                Text("W")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                            VStack{ //Thursday
                                Text("\(dayThu_Tags)")
                                    .foregroundColor(Color("bubblegum"))
                                    .font(Font.caption.bold())
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(dayThu_Tags)/6)
                                    .foregroundColor(Color("bubblegum"))
                                    .cornerRadius(UsefulValues.cornerRadius/6)
                                Text("T")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                            VStack{ //Friday
                                Text("\(dayFri_Tags)")
                                    .foregroundColor(Color("bahama_beach"))
                                    .font(Font.caption.bold())
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(dayFri_Tags)/6)
                                    .foregroundColor(Color("bahama_beach"))
                                    .cornerRadius(UsefulValues.cornerRadius/6)
                                Text("F")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                        }
                        Spacer()
                        Text("Day")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(Color("titleGrey"))
                    }
                    .frame(width: UIScreen.screenWidth/2.8, height: UIScreen.screenHeight/6.5)
                    .padding()
                    .background(Color("darkGrey"))
                } //END Day VStack
                .cornerRadius(UsefulValues.cornerRadius)
                
                VStack{ // Boarder
                    VStack{
                        Spacer().frame(maxWidth: .infinity)
                        HStack(alignment: .bottom){
                            VStack{ //Monday
                                Text("\(boarderMon_Tags)")
                                    .font(Font.caption.bold())
                                    .foregroundColor(Color("acid"))
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(boarderMon_Tags)/6)
                                    .foregroundColor(Color("acid"))
                                    .cornerRadius(UsefulValues.cornerRadius/6)
                                Text("M")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                            VStack{ //Tuesday
                                Text("\(boarderTue_Tags)")
                                    .foregroundColor(Color("rose"))
                                    .font(Font.caption.bold())
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(boarderTue_Tags)/6)
                                    .foregroundColor(Color("rose"))
                                    .cornerRadius(UsefulValues.cornerRadius/6)
                                Text("T")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                            VStack{ //Wednesday
                                Text("\(boarderWed_Tags)")
                                    .foregroundColor(Color("lavender"))
                                    .font(Font.caption.bold())
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(boarderWed_Tags)/6)
                                    .foregroundColor(Color("lavender"))
                                    .cornerRadius(UsefulValues.cornerRadius/6)
                                Text("W")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                            VStack{ //Thursday
                                Text("\(boarderThu_Tags)")
                                    .foregroundColor(Color("bubblegum"))
                                    .font(Font.caption.bold())
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(boarderThu_Tags)/6)
                                    .foregroundColor(Color("bubblegum"))
                                    .cornerRadius(UsefulValues.cornerRadius/6)
                                Text("T")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                            VStack{ //Friday
                                Text("\(boarderFri_Tags)")
                                    .foregroundColor(Color("bahama_beach"))
                                    .font(Font.caption.bold())
                                Rectangle()
                                    .frame(width: UIScreen.screenWidth/20, height: CGFloat(boarderFri_Tags)/6)
                                    .foregroundColor(Color("bahama_beach"))
                                    .cornerRadius(UsefulValues.cornerRadius/6)
                                Text("F")
                                    .font(Font.caption.italic())
                                    .foregroundColor(Color("titleGrey"))
                            }
                        }
                        Spacer()
                        Text("Boarder")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(Color("titleGrey"))
                    }
                    .frame(width: UIScreen.screenWidth/2.8, height: UIScreen.screenHeight/6.5)
                    .padding()
                    .background(Color("darkGrey"))
                } // END Boarder VStack
                .cornerRadius(UsefulValues.cornerRadius)
            } // END DAY v. BOARDER Section
            .listRowSeparator(.hidden)
            .listRowBackground(Color("white").opacity(0.0))
            .listRowInsets(EdgeInsets()) // << avoid extra space
            .listStyle(GroupedListStyle())
            //DAY v. BOARDER END
            
            
            
        } //END List
        .background(Color("darkestGrey"))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(){
            loadData()
            UITableView.appearance().backgroundColor = UIColor(Color("darkestGrey")) //change View Backgrounnd
        }
        .refreshable {
            loadData()
        }
    }
    func loadData() {
        Task{
            allMonTags = await readStats(id: "total1")
            allTueTags = await readStats(id: "total2")
            allWedTags = await readStats(id: "total3")
            allThuTags = await readStats(id: "total4")
            allFriTags = await readStats(id: "total5")
            
            classI_Tags = await readStats(id: "I_Tags")
            classII_Tags = await readStats(id: "II_Tags")
            classIII_Tags = await readStats(id: "III_Tags")
            classVI_Tags = await readStats(id: "IV_Tags") //dw we just wrote it wrong in the FB
            
            dayMon_Tags = await readStats(id: "day1")
            dayTue_Tags = await readStats(id: "day2")
            dayWed_Tags = await readStats(id: "day3")
            dayThu_Tags = await readStats(id: "day4")
            dayFri_Tags = await readStats(id: "day5")
            
            boarderMon_Tags = await readStats(id: "boarder1")
            boarderTue_Tags = await readStats(id: "boarder2")
            boarderWed_Tags = await readStats(id: "boarder3")
            boarderThu_Tags = await readStats(id: "boarder4")
            boarderFri_Tags = await readStats(id: "boarder5")
        }
    }
}

struct Stats_View_Previews: PreviewProvider {
    static var previews: some View {
        Stats_View()
            .preferredColorScheme(.dark)
    }
}
