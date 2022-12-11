// main.cpp
#include <iostream>
#include <ostream>
using namespace std;

#pragma pack(1)
struct Node
{
	int value;
	Node *left;
	Node *right;
	Node *parent;
	Node()
	{
		value = 0;
		left = NULL;
		right = NULL;
		parent = NULL;
	};
	Node(int val)
	{
		value = val;
		left = NULL;
		right = NULL;
		parent = NULL;
	}
	Node(int val, Node* nodes)
	{
		value = val;
		left = NULL;
		right = NULL;
		parent = nodes;
	};
	Node* addNode(Node* node, int val, Node* curr)
	{
		if (!node)
		{
			return new Node(val, curr);
		}
		if (val < node->value)
		{
			node->left = addNode(node->left, val,node);
		}
		else
		{
			node->right = addNode(node->right, val,node);
		}

		return node;
	};
};

extern "C" int __stdcall inOrder(Node*, int);
extern "C" int __stdcall postOrder(Node*, int);
extern "C" int __stdcall preOrder(Node*, int);
extern "C" int __stdcall nodeCount(Node*);

int main()
{
	//max of 32 nodes
	int num = 0;
	Node head = Node(10);
	head.addNode(&head, 5, &head);
	head.addNode(&head, 3, &head);
	head.addNode(&head, 2, &head);
	head.addNode(&head, 4, &head);
	head.addNode(&head, 7, &head);
	head.addNode(&head, 6, &head);
	head.addNode(&head, 8, &head);
	head.addNode(&head, 15, &head);
	head.addNode(&head, 12, &head);
	head.addNode(&head, 11, &head);
	head.addNode(&head, 13, &head);
	head.addNode(&head, 20, &head);
	head.addNode(&head, 17, &head);
	head.addNode(&head, 21, &head);

	//count
	int count = nodeCount(&head);
	cout << "Count: " << count << endl;

	//In order
	cout << "In Order: ";
	for (int i = 0; i < count; ++i)
	{
		i *= 8;
		num = inOrder(&head, i);
		cout << num << " ";
		i /= 8;
	}
	cout << endl;
	
	//Post order
	cout << "Post Order: ";
	for (int i = 0; i < count; ++i)
	{
		i *= 8;
		num = postOrder(&head, i);
		cout << num << " ";
		i /= 8;
	}
	cout << endl;
	
	//Pre order
	cout << "Pre Order: ";
	for (int i = 0; i < count; ++i)
	{
		i *= 8;
		num = preOrder(&head, i);
		cout << num << " ";
		i /= 8;
	}
	cout << endl;

	return 0;
}