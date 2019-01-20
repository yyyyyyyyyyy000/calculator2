//
//  Demo.swift
//  calculator2
//
//  Created by 无敌帅的yyyyy on 2019/1/15.
//  Copyright © 2019年 无敌帅的yyyy. All rights reserved.
//

import Foundation
struct calculatebrain{
    var accumulator:Double?
    
    enum operation{
        case constant(Double)
        case unaryoperation((Double)->Double)
        case binaryoperation((Double,Double)->Double)
        case equal
    }
    
    var tabel = ["pi":operation.constant(Double.pi),"e":operation.constant(M_E),"+-":operation.unaryoperation({-$0}),"√":.unaryoperation({sqrt($0)}),"*":.binaryoperation({$0*$1}),
                 "=":.equal]
    
    mutating func performoperation(_ symbol:String){
        if let operationcontant = tabel[symbol]{
            switch operationcontant{
            case .constant(let constant):
                accumulator = constant
            case .unaryoperation(let function):
                accumulator = function(accumulator!)
            case .binaryoperation(let function):
                if accumulator != nil{
                    pro = pendingoperation(function: function, firstoperand: accumulator!)
                    accumulator = nil
                }
            case .equal:
                accumulator = pro?.perform(with: accumulator!)
                pro = nil
            }
        }
        
    }
    
    private var pro:pendingoperation?
    
    
    //暂存数据、所用函数
    private struct pendingoperation{
        var function:(Double,Double)->Double
        var firstoperand:Double
        func perform(with secondoperand:Double)->Double{
            return function(firstoperand,secondoperand)
        }
    }
    
    mutating func settheoperand(_ operand:Double){
        accumulator = operand
    }
    
    
    var result:Double?{
        get{
            return accumulator
        }
    }
    
    
}
