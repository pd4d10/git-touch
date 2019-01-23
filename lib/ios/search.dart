import 'package:flutter/cupertino.dart';
import '../providers/search.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SearchBloc bloc = SearchProvider.of(context);

    return SafeArea(
      child: Column(
        children: <Widget>[
          CupertinoTextField(
            placeholder: 'Type to search',
            onChanged: (String value) {
              bloc.keywordUpdate.add(value);
            },
            onSubmitted: (String value) {
              bloc.submit.add(value);
            },
          ),
          CupertinoSegmentedControl(
            children: {0: Text('Repos'), 1: Text('Users')},
            onValueChanged: (int value) {
              bloc.activeUpdate.add(value);
            },
          ),
          StreamBuilder<bool>(
            stream: bloc.loading,
            builder: (context, snapshot) {
              if (snapshot.data == null || snapshot.data) {
                return CupertinoActivityIndicator();
              }

              return StreamBuilder(
                stream: bloc.users,
                builder: (context, snapshot) {
                  var users = snapshot.data;
                  if (users == null) return Text('');
                  if (users.length == 0) {
                    return Text("No result");
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      var user = users[index];
                      return Row(
                        children: <Widget>[
                          Image.network(
                            user['avatarUrl'],
                          ),
                          Text(user['login'])
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
