//
//  ASyncTests.swift
//  Gotcha
//
//  Created by Andrew Rodriguez on 6/3/22.
//

import SwiftUI

struct ASyncTests: View {
    var body: some View {
        Task{
            
            let user = "Andrew_Rodriguez23@milton.edu"
            
            
            print(firstName(uid: user)
        }
        
    }
}

struct ASyncTests_Previews: PreviewProvider {
    static var previews: some View {
        ASyncTests()
    }
}
