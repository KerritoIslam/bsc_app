import 'package:bsc_app/ai/logic/model/resModel.dart';
import 'package:bsc_app/core/dioServices.dart';
import 'package:dio/dio.dart';

class Remotesouce {
  final api=Dioservices.dio;
  Future<Resmodel> getResponse(String prompt)async{
    try{
  final realPrompt='If I talk About something Other than boumerdess city on general answer me with the following:Ask me about Boumerdess city only. and here is the talk :$prompt';
   final res=await api.post('/ai/',data: {'prompt':prompt});
    final message=res.data[0]['content']['parts'][0]['text'];
      print(message);
    return Resmodel(res.statusCode??200, message);
    }on DioException catch(e){
      return Resmodel(e.response?.statusCode??500, e.response?.data['message']??'Error');
    }
  }
}
