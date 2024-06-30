import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:trinity_wizard_test/module/data/datasource/local/ContactData.dart';

part 'contact_cubit.freezed.dart';
part 'contact_state.dart';

@injectable
class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(const ContactState.initial());

  List<Map<String, String>> dataContact = ContactData.dataContact;

  void getDataContact() {
    emit(const _Loading());
    Future.delayed(const Duration(microseconds: 100));
    emit(_Success(data: dataContact));
  }

  void addContact({
    required Map<String, String> data,
  }) {
    emit(const _Loading());
    Future.delayed(const Duration(microseconds: 100));
    dataContact.add(data);
    emit(_Success(data: dataContact));
  }
}
