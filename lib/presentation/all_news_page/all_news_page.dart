import 'dart:developer';

import 'package:bloc_test_app/presentation/all_news_page/bloc/all_news_bloc.dart';
import 'package:bloc_test_app/presentation/all_news_page/widgets/custom_textformfield.dart';
import 'package:bloc_test_app/presentation/all_news_page/widgets/news_list.dart';
import 'package:bloc_test_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllNewsPage extends StatefulWidget {
  const AllNewsPage({super.key});

  @override
  State<AllNewsPage> createState() => _AllNewsPageState();
}

class _AllNewsPageState extends State<AllNewsPage> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.unfocus();
    }

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      final state = context.read<AllNewsBloc>().state;
      if (state is NewsFetchedSuccessfully && !state.isLoading) {
        context.read<AllNewsBloc>().add(
              FetchingNewsEvent(),
            );
        log("fetch");
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: isSearching
            ? CustomTextForm(
                controller: _searchController,
                width: 250,
                height: 50,
                onChanged: (text) {
                  context.read<AllNewsBloc>().add(
                        SearchingNewsEvent(text: text),
                      );
                },
              )
            : Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 5),
                child: const Text(
                  "All News",
                  style: MyTextStyles.appBarTitleStyle,
                ),
              ),
        leading: !isSearching
            ? IconButton(
                onPressed: () {
                  setState(
                    () {
                      isSearching = !isSearching;
                    },
                  );
                },
                icon: const Icon(
                  Icons.search,
                ),
              )
            : BackButton(onPressed: () {
                if (_searchController.text != "") {
                  context.read<AllNewsBloc>().add(RefreshingNewsEvent());
                  _searchController.text = "";
                }
                setState(
                  () {
                    isSearching = !isSearching;
                  },
                );
              }),
      ),
      body: BlocConsumer<AllNewsBloc, AllNewsState>(
        listener: (context, state) {
          if (state is NewsFetchedWithError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.grey,
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is NewsFetchedSuccessfully) {
            if (isSearching) {
              return NewsList(
                news: state.news,
                scrollController: _scrollController,
                isLoading: state.isLoading,
                onTap: () async {},
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<AllNewsBloc>().add(RefreshingNewsEvent());
                },
                child: NewsList(
                  news: state.news,
                  scrollController: _scrollController,
                  isLoading: state.isLoading,
                  onTap: () {},
                ),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
